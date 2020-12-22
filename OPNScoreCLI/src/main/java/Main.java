import java.io.File;
import java.util.Scanner;

public class Main {
  public static void main(String[] args) {
    String scenarioPath = "";
    if (!args[0].equals(""))
      scenarioPath = "scenario.json";
    String rawScenario = readScenario(scenarioPath);
    System.out.println(rawScenario);
  }

  private static String readScenario(String path) {
    StringBuilder rawScenario = new StringBuilder();
    try {
      Scanner input = new Scanner(new File(path));
      while (input.hasNextLine()) {
        String temp = input.nextLine();
        rawScenario.append(temp);

      }
      input.close();
    } catch (Exception e) {
      System.out.println("Error reading or parsing " + path);
    }
    return rawScenario.toString();
  }
}
