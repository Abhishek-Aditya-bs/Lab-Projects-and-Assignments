import java.util.*;

public class TQManager2{
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        // System.out.println("Enter the number of questions: ");
        int numQuestions = sc.nextInt();
        TestQuestion[] questions = new TestQuestion[numQuestions];
        for(int i=0; i<numQuestions; i++) {
            // System.out.println("Enter the type of question: ");
            // System.out.println("Enter 1 for Short Answer, 2 for Long Answer, 3 for MCQ");
            int type = sc.nextInt();
            switch(type) {
                case 1:
                    questions[i] = new ShortAnswer();
                    break;
                case 2:
                    questions[i] = new LongAnswer();
                    break;
                case 3:
                    questions[i] = new MCQ();
                    break;
                default:
                    System.out.println("Invalid type of question");
                    System.exit(0);
                    break;
            }
            questions[i].readQuestion();
    }
        System.out.println("----------- Questions -----------"); 
        System.out.println();
        for(int i=0; i<numQuestions; i++) {
            // print questions with question number and type
            System.out.println("Question " + (i+1) + ": \n" + questions[i].toString());
            System.out.println();
        }

        System.exit(0);
        // close scanner
        sc.close();
    }
}


class TestQuestion {
    String question;
    public void readQuestion(){}
}

class ShortAnswer extends TestQuestion {
    int numLines = 1;
    public void readQuestion() {
        // Scanner sc = new Scanner(System.in);
        // System.out.println("Enter the question: ");
        this.question = System.console().readLine();
        // System.out.println("Enter the number of lines: ");
        // this.numLines = sc.nextInt();
    }
    public String toString() {
        return "Question (Short Answer Type): \n" +  "Number of lines: " + this.numLines + "\n" + this.question ;
    }
}

class LongAnswer extends TestQuestion {
    int numLines;
    public void readQuestion() {
        Scanner sc = new Scanner(System.in);
        // System.out.println("Enter the number of lines: ");
        this.numLines = sc.nextInt();
        // take question as input according to number of lines
        // System.out.println("Line : " + (1));
        this.question = System.console().readLine();
        this.question += "\n";
        for(int i=1; i<this.numLines; i++) {
            // System.out.println("Line : " + (i+1));
            this.question += System.console().readLine();
            this.question += "\n";
        }
        sc.close();
    }
    public String toString() {
        return "Question (Long Answer Type): \n" +  "Number of lines: " + this.numLines + "\n" + this.question ;
    }
}

class MCQ extends TestQuestion {
    int numChoices;
    String[] choices;
    public void readQuestion() {
        Scanner sc = new Scanner(System.in);
        // System.out.println("Enter the question: ");
        this.question = sc.nextLine();
        // System.out.println("Enter the number of choices: ");
        this.numChoices = sc.nextInt();
        this.choices = new String[this.numChoices];
        for(int i=0; i<this.numChoices; i++) {
            // System.out.println("Enter the choice " + (i+1) + ": ");
            this.choices[i] = System.console().readLine();
        }
        sc.close();
    }
    public String toString() {
        String str = "Question (MCQ Type): \n" + this.question + " \nNumber of choices: " + this.numChoices + "\nChoices: \n";
        for(int i=0; i<this.numChoices; i++) {
            str += (i+1) + ". " + this.choices[i] + "\n";
        }
        return str;
    }
}

