public class NumberProcessor {
    public static void processNumbers(Integer num1, Integer num2) {
        if (num1 == null || num2 == null) {
            System.debug('One or both numbers are null. Exiting method.');
            return;
        }
        
        Integer sum = num1 + num2;
        Integer diff = num1 - num2;
        Integer result = sum * diff;
    }
}