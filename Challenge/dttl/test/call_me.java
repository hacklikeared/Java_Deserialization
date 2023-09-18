package dttl.test;

import java.io.IOException;
import java.io.Serializable;

public class call_me implements Serializable{
    private String cmd = "Hello there. Coffee?";
    private boolean run_cmd = false;

    public call_me(){
    }

    public call_me(String cmd, boolean run_cmd){
        this.cmd = cmd;
        this.run_cmd = run_cmd;
    }

    public String never_call_me(){
        try {
            if(this.run_cmd){
                Runtime.getRuntime().exec(this.cmd);
            }
        }
        catch (IOException e) {
            //Do nothing
        }
        return this.cmd;
    }
}

