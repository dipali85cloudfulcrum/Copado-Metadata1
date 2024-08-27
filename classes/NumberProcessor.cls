public class NumberProcessor {
    public static void processNumbers(Integer num1, Integer num2) {
        if (num1 == null || num2 == null) {
            System.debug('One or both numbers are null. Exiting method.');
            return;
        }
        
        Integer add = num1 + num2;
        Integer sub = num1 - num2;
        Integer result = add * sub;   
        
        System.debug('Sum of numbers: ' + add);
        System.debug('Difference of numbers: ' + sub);
        System.debug('Result (Sum * Difference): ' + result);
    }
}