package position.web.cty.exception;

public class PositionException extends RuntimeException {
	private static final long serialVersionUID = 1L;

	public PositionException(String message){
		super(message);
	}
	
	public PositionException(Throwable cause)
	{
		super(cause);
	}
	
	public PositionException(String message, Throwable cause)
	{
		super(message,cause);
	}
}
