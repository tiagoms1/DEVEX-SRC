package obi1.fi.test;

import static org.junit.Assert.fail;

import java.util.concurrent.TimeUnit;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;

public class SeleniumTest {
  private WebDriver driver;
  private String baseUrl;
  private StringBuffer verificationErrors = new StringBuffer();

  public static void main(String[] args) {
	  new SeleniumTest().runTest();
  }

  public void runTest() {
	try {
		setUp();
		testSelenium();
	}
	catch (Exception x) {
		x.printStackTrace();
	}
	finally {
		try {
			tearDown();
		}
		catch (Exception x) {
			x.printStackTrace();
		}
	}
  }
  
  @Before
  public void setUp() throws Exception {
    driver = new FirefoxDriver();
    baseUrl = "http://localhost:8082";
    driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
  }

  @Test
  public void testSelenium() throws Exception {
    driver.get(baseUrl + "/Tickets/fi/Home/load");
    
    Thread.sleep(500);
    driver.findElement(By.id("menuLogin")).click();
    driver.findElement(By.id("clieDsLogin")).clear();
    driver.findElement(By.id("clieDsLogin")).sendKeys("felipe");
    driver.findElement(By.id("clieDsPwd")).clear();
    driver.findElement(By.id("clieDsPwd")).sendKeys("felipe");
    driver.findElement(By.xpath("//button[@type='submit']")).click();
    
    Thread.sleep(500);
    checkEvento("1", "Futebol");
    checkEvento("2", "Shows");
    checkEvento("3", "Teatro");
    checkEvento("4", "Cinema");
    checkEvento("5", "Lutas");
    
    driver.findElement(By.cssSelector("div.menuItem")).click();
  }

  public void checkEvento(String idMenu, String evento) throws Exception {
	  driver.findElement(By.xpath("//div[@onclick=\"openMenu('../Ticket/load?evenCdTipo="+ idMenu +"');\"]")).click();
    if (!isElementPresent(By.cssSelector("div.ticket"))) {
    	verificationErrors.append("Erro ao tentar abrir o evento '"+ evento +"'.");
    	throw new Exception("Nenhum ticket de '"+ evento +"' encontrado.");
    }

    //Fazendo a compra
    driver.findElement(By.xpath("//form/div[2]//button")).click();
    driver.findElement(By.xpath("//div[@id='dialogTemplate']//button")).click();
    Thread.sleep(5000);
    driver.findElement(By.xpath("//div[@id='dialogTemplate']/div[3]/button[3]")).click();
  }
  
  @After
  public void tearDown() throws Exception {
    driver.quit();
    String verificationErrorString = verificationErrors.toString();
    if (!"".equals(verificationErrorString)) {
      fail(verificationErrorString);
    }
  }

  private boolean isElementPresent(By by) {
	    try {
	      driver.findElement(by);
	      return true;
	    } catch (NoSuchElementException e) {
	      return false;
	    }
	  }

}
