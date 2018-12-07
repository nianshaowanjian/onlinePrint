package com.yang.unit;

import com.yang.model.User;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.Enumeration;


@Component
@Aspect
public class LogUtils {

    private static final Logger LOGGER = LoggerFactory.getLogger(LogUtils.class);

    @Pointcut("execution (public * com.yang.controller.*Controller.*(..))")
    public void controllerAspect(){

    }

    @Pointcut("@annotation(com.yang.unit.SystemLog)")
    public void managerAspect(){

    }

    @Around("managerAspect()")
    public Object around(ProceedingJoinPoint joinPoint) throws Throwable{
        String className = joinPoint.getTarget().getClass().getName();
        String methodName = joinPoint.getSignature().getName();
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        StringBuffer var10 = new StringBuffer("");
        String var12;
        String[] var13;
        for(Enumeration var11=request.getParameterNames();var11.hasMoreElements();var10.append(var12).append("=").append(Arrays
                .toString(var13))){
            var12 = (String)var11.nextElement();
            var13 = request.getParameterValues(var12);
            if(var10.length()>0){
                var10.append("  ");
            }
        }
        String operation = querySystemLogOperation(joinPoint);

        String uphone = "";

        HttpSession session = request.getSession();
        if(session.getAttribute("user")!=null){
            uphone = ((User) session.getAttribute("user")).getUphone();
        }
        LOGGER.info("["+className+"]["+methodName+"] BEGIN:"+uphone+" "+operation+":"+var10);

        Object retval = joinPoint.proceed();

        LOGGER.info("["+className+"]["+methodName+"]  END："+retval.toString());

        return retval;

    }

    public static String querySystemLogType(JoinPoint joinPoint){
        try{
            String className = joinPoint.getTarget().getClass().getName();
            String methodName = joinPoint.getSignature().getName();
            Object[] arguments = joinPoint.getArgs();
            Class targetClass = Class.forName(className);
            Method[] methods =targetClass.getMethods();
            String type="";
            for(Method method:methods){
                if (method.getName().equals(methodName)) {
                    Class[] classz = method.getParameterTypes();
                    if(classz.length==arguments.length){
                        type = method.getAnnotation(SystemLog.class).type();
                        break;
                    }
                }
            }
            return type;
        }catch (Exception e){

        }
        return "111";
    }

    public static String querySystemLogOperation(JoinPoint joinPoint){
        try{
            String className = joinPoint.getTarget().getClass().getName();
            String methodName = joinPoint.getSignature().getName();
            Object[] arguments = joinPoint.getArgs();
            Class targetClass = Class.forName(className);
            Method[] methods = targetClass.getMethods();
            String operation = "";
            for(Method method:methods){
                if(method.getName().equals(methodName)){
                    Class[] classz = method.getParameterTypes();
                    if(classz.length==arguments.length){
                        operation = method.getAnnotation(SystemLog.class).operation();
                        break;
                    }
                }
            }
            return operation;
        }catch (Exception e){

        }
        return "111";
    }

    @AfterThrowing(pointcut = "controllerAspect()", throwing = "throwable")
    public void  doAfterThrowing(JoinPoint joinPoint, Throwable throwable) {
        String operateContent = null;
        try {
            String targetName = joinPoint.getTarget().getClass().getName();
            String methodName = joinPoint.getSignature().getName();
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw, true);
            throwable.printStackTrace(pw);
            pw.flush();
            sw.flush();
            String info = "["+targetName+"]["+methodName+"]\n" + sw.toString() + "\n";
            LOGGER.error(info);
        } catch (Exception e) {
        }
    }

}
