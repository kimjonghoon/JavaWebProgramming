package net.java_school.logtest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class LogTest {
    private Log log = LogFactory.getLog(LogTest.class);
    // 또는 private Log log = LogFactory.getLog(this.getClass());
    
    public void x() {
        if (log.isDebugEnabled()) {
            log.debug("debug message");
        }
    }
  
    public static void main(String[] args) {
        LogTest test = new LogTest();
        test.x();
    }
}
