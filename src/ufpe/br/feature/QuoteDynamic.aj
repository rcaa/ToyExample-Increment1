package ufpe.br.feature;

public aspect QuoteDynamic extends Quote {

	pointcut driver() : if (Driver.isActivated("quote")); // true default
	
	pointcut quote(String string) : Quote.quote(string) && driver();
	pointcut quote2(String string) : Quote.quote2(string) && driver();
	
	void around() : adviceexecution() && within(ufpe.br.feature.Quote) 
	&& !@annotation(AroundAdvice){
		if (Driver.isActivated("quote")){
			proceed();
		}
	}
}