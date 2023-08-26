import java.util.Scanner;

class Email {
    private String firstName;
    private String lastName;
    private int EmpID;
    private String password;
    private String department;
    private String email;
    private int mailboxCapacity = 500;
    private int defaultPasswordLength = 8;
    private String alternateEmail;
    private String CompanySuffix = "abccompany.com";

    // Constructor to receive the first name  last name and EmployeeId.
    public Email(String firstName, String lastName, int EmpID) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.EmpID = EmpID;

        // calling a method asking for the Deparment and return the department
        this.department = setDepartment();

        // calling a method that returns a random password
        this.password = randomPassword(defaultPasswordLength);

        // Combine elements to generate Email and Password
        email = firstName.toLowerCase() + "." + lastName.toLowerCase() + "." + EmpID + "@" + department + "."
                + CompanySuffix;
        System.out.println("Hii ! " + firstName + " Your Email has been successfully created.");
        System.out.println("Your email : " + email);
        System.out.println("Your password : " + password);
        System.out.println("Your mail box capacity :" + mailboxCapacity + " MB");

    }

    // Ask for the department

    private String setDepartment() {
        System.out.print("DEPARTMENT CODE : \n 1 for Sales \n 2 for Development \n 3 for Accounting \n 0 for none \n");
        System.out.print("Enter the codes of your Department: ");
        Scanner in = new Scanner(System.in);
        int depChoice = in.nextInt();
        if (depChoice == 1) {
            return "Sales";
        } else if (depChoice == 2) {
            return "dev";
        } else if (depChoice == 3) {
            return "acct";
        } else {
            return "";
        }
    }

    // Generate Random Password
    private String randomPassword(int length) {
        String passwordSet = "abcdefghijklmnopqrstuvwxyz0123456789@#$&*";
        char[] password = new char[length];
        for (int i = 0; i < length; i++) {
            int rand = (int) (Math.random() * passwordSet.length());
            password[i] = passwordSet.charAt(rand);
        }
        return new String(password);
    }

    // Set the mailBox capacity
    public void setMailboxCapacity(int capacity) {
        this.mailboxCapacity = capacity;
        System.out.println("Your mailBox Capacity has been updated successfully.");
    }

    // Set the alternate email
    public void setAlternateEmail(String altEmail) {
        this.alternateEmail = altEmail;
        System.out.println("Alternate Email has been saved successfully.");
    }

    // change the password
    public void changePassword(String password) {
        this.password = password;
        System.out.println("Your password has been changed successfully.");
    }

    public String showInfo() {
        return "Name : " + firstName + " " + lastName +
                "\nCompany Email : " + email +
                "\nPassword :" + password +
                "\nMailbox Capacity : " + mailboxCapacity + " MB" +
                "\nAlternate Email : " + alternateEmail;

    }
}

public class EmailApp2 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.print("Enter your first name: ");
        String first = scan.nextLine();
        System.out.print("Enter your last name: ");
        String last = scan.nextLine();
        System.out.print("Enter your EmployeeID : ");
        int EId = scan.nextInt();

        Email employee1 = new Email(first, last, EId);
        // Option for further action

        String newPassword;
        String altEmail;
        int newCapacity;
        int opinion;

        System.out.println("You may add or modify your detail.");
        System.out.println(" 1 For Password Change \n 2 For Adding Alternate Email ");
        System.out.println(" 3 For Changing MailBox Capacity \n 0 For None");
        int option;
        while (true) {
            System.out.print("\n\n Enter your choice : ");

            option = scan.nextInt();

            if (option == 1) {
                System.out.print("Enter your new Password :");
                newPassword = scan.next();
                employee1.changePassword(newPassword);

            }
            if (option == 2) {
                System.out.print("Enter your Alternate Email :");
                altEmail = scan.next();
                employee1.setAlternateEmail(altEmail);

            }
            if (option == 3) {
                System.out.print("Update your new mailBox capacity :");
                newCapacity = scan.nextInt();
                employee1.setMailboxCapacity(newCapacity);

            }
            if (option == 0) {
                break;
            }

        }

        System.out.println("Do you want to see updated information ?  ");
        System.out.println("Choose 1 For 'YES' \n       2 For 'NO'");
        opinion = scan.nextInt();
        if (opinion == 1) {
            System.out.print(employee1.showInfo());
        } else if (opinion == 2) {
            System.out.println("Thank You !");
        }

    }
}
