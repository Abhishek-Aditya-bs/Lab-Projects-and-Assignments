import java.util.*;

class Card {
    String value;
    String suit;
    public Card(String suit, String value){
        this.suit = suit;
        this.value = value;
    }
    String display(){
        return value + " of " + suit;
    }
}

class Pile {
    int size;
    Card[] cards;
    int top;
    public Pile(){
        this.size = 10;
        this.cards = new Card[size];
        this.top = -1;
    }
    void place(Card c){
        if(this.top == this.size-1){
            System.out.println("pile full");
        }
        else{
            this.cards[++this.top] = c;
        }
    }
    Card draw(){
        if(this.top == -1){
            System.out.println("pile empty");
            return null;

        }
        else{
            return this.cards[this.top--];
        }
    }
    void peek(){
        if(this.top == -1){
            System.out.println("pile empty");
        }
        else{
            System.out.println(this.cards[this.top].display());
        }
    }
    void display(){
        for(int i=this.top; i>=0; i--){
            this.cards[i].display();
        }
    }

}

class StackDemo {
	public static void main(String[] args) {
		Pile stack = new Pile();
		int ch;
		System.out.println("enter your choice 1. place 2.draw 3.peek 4. exit");
		Scanner input = new Scanner(System.in);
		ch = input.nextInt();
		do
		{	switch(ch)
			{
				case 1: System.out.println("enter the card suit and card value");
						String suit = input.next();
						String value = input.next();
						Card c = new Card(suit, value);	
						stack.place(c);
						break;
				case 2: Card d = stack.draw();
						if(d.value != null)	
						System.out.println("Card Drawn:" + d.display());break;
				case 3:	stack.peek();break;
				default: System.exit(0);
			}
			System.out.println("enter your choice 1. place 2.draw 3.peek 4. exit");
			ch = input.nextInt();
		}while(ch<4); 
	}
}
