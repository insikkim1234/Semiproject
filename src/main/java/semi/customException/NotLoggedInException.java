package semi.customException;

public class NotLoggedInException extends RuntimeException {
    public NotLoggedInException() {
        super("Login Session Not found");
    }
}
