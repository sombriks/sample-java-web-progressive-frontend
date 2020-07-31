package sample.library;

import java.util.ArrayList;
import java.util.List;

public class Dados {

	public int foo() {
		return 42;
	}
	private List<TodoItem> items=new ArrayList<>();

	public List<TodoItem> getItems() {
		return items;
	}
}