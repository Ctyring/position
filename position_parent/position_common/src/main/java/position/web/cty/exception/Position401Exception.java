package position.web.cty.exception;

public class Position401Exception extends RuntimeException {
	private static final long serialVersionUID = 1L;

	public Position401Exception(String message){
		super(message);
	}

	public Position401Exception(Throwable cause)
	{
		super(cause);
	}

	public Position401Exception(String message, Throwable cause)
	{
		super(message,cause);
	}
}
