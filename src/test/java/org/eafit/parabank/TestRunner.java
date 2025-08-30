package org.eafit.parabank;

import com.intuit.karate.junit5.Karate;

class TestRunner {

    @Karate.Test
    Karate test01_ParabankLogin() {
        return Karate.run("login")
                .relativeTo(getClass())
                .outputCucumberJson(true);
    }
    
    @Karate.Test
    Karate test02_ParabankTransfer() {
        return Karate.run("transfer")
                .relativeTo(getClass())
                .outputCucumberJson(true);
    }
    @Karate.Test
    Karate test03_ParabankPay() {
        return Karate.run("billpay")
                .relativeTo(getClass())
                .outputCucumberJson(true);
    }
}
