package conduitApp;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;

import net.masterthought.cucumber.ReportBuilder;

import static org.junit.jupiter.api.Assertions.*;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import java.io.File;

import net.masterthought.cucumber.Configuration;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;


class ConduitTest {

    @Test
    void testParallel() {
    Results results = Runner.path("classpath:conduitApp")
    .outputCucumberJson(true)
    .parallel(3);
    // @parallel=false  can be used on the top of the feature or Scenario if needed to run sequentially 
        
    generateReport(results.getReportDir());
    assertTrue(results.getFailCount() == 0, results.getErrorMessages());

    }

    // @Karate.Test
    // Karate testTags() {
    // return Karate.run().tags("@debug").relativeTo(getClass());
    // }

    // @Karate.Test
    // Karate runAll() {
    //     return Karate.run().relativeTo(getClass());
    // }

        public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "conduitApp");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}