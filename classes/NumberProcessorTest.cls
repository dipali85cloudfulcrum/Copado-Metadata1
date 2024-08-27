@IsTest
public class NumberProcessorTest {
    @IsTest
    static void testProcessNumbers() {
        // Test case 1: Both numbers are non-null
        NumberProcessor.processNumbers(10, 5);

        // Test case 2: One number is null
        NumberProcessor.processNumbers(null, 5);

        // Test case 3: Both numbers are null
        NumberProcessor.processNumbers(null, null);
    }
}