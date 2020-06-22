package com.lambda.demo;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.function.Consumer;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.function.Supplier;

/**
 * java.util.function套件
 * @author Cherry
 * 2020年4月14日
 */
public class JavaFunctionalInterface {
	public static void main(String[] args) {
//		show();
//		show1();
//		show2();
		show3();
	}
	
	public static void show() {
		Optional<String> op = optionalShow(4);
		String o = "无值";
		//isPresent()判断有值
//		if(op.isPresent()) {
//			o =  op.get();
//		}
		o = op.orElse("无值A");
		System.out.println(o);
	}
	
	public static void show1() {
		Teacher[] te = {new Teacher("Jack",23,"Math"),new Teacher("Marry",15,"Math"),new Teacher("Jhon",34,"Math")};
		List<Teacher> array = Arrays.asList(te);
		//使用Consumer接口消耗array
		consumerShow(array,System.out::println);
		consumerShow(array,(s) ->{
			try(ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(s.getName()))){
				oos.writeObject(s);
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} );
	}
	
	public static void show2() {
		long time = functionShow(new Date(),Date::getTime);
		String strDates = functionShow(new Date(),Date::toString);
		System.out.println(time);
		System.out.println(strDates);
	}
	
	public static void show3() {
		predicateShow();
		Teacher[] te = {new Teacher("Jack",23,"Math"),new Teacher("Marry",15,"Math"),new Teacher("Jhon",34,"Math")};
		List<Teacher> array = Arrays.asList(te);
		boolean b = predicateShow2(te[0],(t) -> t.getAge() > 30);
		System.out.println(b);
	}
	
	public static void show4(){
		long date = supplierShow(() -> new Date().getTime());
	}
	
	//使用Optional处理空置，实现速错（快速排查错误）
	public static Optional<String> optionalShow(int i){
		Map<Integer,String> map = new HashMap<Integer,String>(5);
		map.put(1,"Jack");
		map.put(2,"Chen");
		map.put(3,"Marry");
		//empty()和of()方法
//		return map.get(i) == null ? Optional.empty():Optional.of(map.get(i));
		//ofNullable()判断是否为空，为空调用empty(),不为空调用of()
		return Optional.ofNullable(map.get(i));
	}
	
	//Consumer函数接口--消耗变量
	public static <T> void consumerShow(List<T> list,Consumer<T> consume) {
		Objects.requireNonNull(list);
		Objects.requireNonNull(consume);
		for(T t : list) {
			consume.accept(t);
		}
	}

	//Function函数接口----  y = f(x)
	public static <T,R> R functionShow( T t ,Function<T, R> fun) {
		Objects.requireNonNull(fun);
		return fun.apply(t);
	}
	
	//Predicate函数接口--- boolean = f(x) 接受参数输出布尔值
	public static void predicateShow() {
		Predicate<String> pre = (s) -> s.startsWith("C");
		boolean b = pre.test("Cherry");
		System.out.println(b);
	}
	public static boolean predicateShow2(Teacher t, Predicate<Teacher> p) {
		Objects.requireNonNull(p);
		return p.test(t);
	}
	
	//Supplier函数接口 --- y = f()
	public static <T>  T supplierShow(Supplier<T> s) {
		Objects.requireNonNull(s);
		return s.get();
	}
	
}
