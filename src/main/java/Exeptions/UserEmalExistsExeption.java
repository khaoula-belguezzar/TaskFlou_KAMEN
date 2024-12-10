package Exeptions;

public class UserEmalExistsExeption extends RuntimeException{
    public UserEmalExistsExeption(String message){
        super(message);
    }
}
