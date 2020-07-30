package sample.library;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class DadosTest {

	@Test
	public void deveriaFuncionar() {
		assertEquals(42, new Dados().foo());
	}
}