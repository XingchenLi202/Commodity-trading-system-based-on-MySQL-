package cn.edu.bzu.entity;

public class trade {
	
	private String thing;
    private int number;   
    private int price;   
    
    public int getNumber() {
        return number;
    }
    public void setNumber(int number) {
        this.number = number;
    }
    public int getPrice() {
        return price;
    }
    public void setPrice(int price) {
        this.price = price;
    }
    
    public String getThing() {
        return thing;
    }
    public void setThing(String thing) {
        this.thing = thing;
    }

    public trade(String thing, int price,int number) {
        super();
        this.thing = thing;
        this.number = number;
        this.price = price;
    }
    
}