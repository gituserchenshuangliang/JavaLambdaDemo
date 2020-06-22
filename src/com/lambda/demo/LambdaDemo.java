package com.lambda.demo;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.function.Function;

/**
 * Lambda表达式
 * 函数接口
 * @author Cherry
 * 2020年4月13日
 */
public class LambdaDemo {

	public static void main(String[] args) {
		show();
//		show1();
//		show2();
	}
	public static void show2() {
		List<String> list = Arrays.asList(new String[] {"Jack","Mark","Cheryy"});
//		List<Student> ls = constructorPreference(list,s -> new Student(s));
		List<Student> ls = constructorPreference(list,Student::new);
		ls.forEach(System.out::println);
	}
	
	public static void show1() {
		Teacher[] te = {new Teacher("Jack",23,"Math"),new Teacher("Marry",15,"Math"),new Teacher("Jhon",34,"Math")};
		List<Teacher> array = Arrays.asList(te);
		//使用方法参考实现多种排序
		array.sort(TeacherCompare::comparemajor);
		array.sort(TeacherCompare::compareName);
		array.sort(TeacherCompare::compareNameLength);
		array.sort(TeacherCompare::compareAge);
		Comparator<Teacher> c1 = (t1,t2)-> t1.getAge()-t2.getAge();
		Comparator<Teacher> c = TeacherCompare::compareAge;
		//Comparator任由很多默认方法
		array.sort(c.thenComparing(TeacherCompare::compareName).thenComparing(TeacherCompare::compareNameLength));
		array.sort(c1);
		array.sort((t1,t2)-> t1.getAge()-t2.getAge());
		array.forEach(System.out::println);
	}
	
	public static void show() {
		//使用Lambda表达式简化单一方法的接口
		Fly fly = ((s) -> {
			System.out.println("Fly接口的fly具体方法");
			System.out.println(s);
		});
		fly.fly("cherry");
		fly.show();
		//使用多态方式 指定方法具体内容
		flyShow((s) -> {
			System.out.println("Fly接口的fly具体方法");
			System.out.println(s);
		});
	}
	
	//即使不知道接口的具体方法依然可以调用
	public static void flyShow(Fly f) {
		f.fly("Butterfly");
	}
	
	//将P -> R 类型转换
	@SuppressWarnings("unchecked")
	public static <P,R> List<R> constructorPreference(List<P> list,Function<P, R> fun) {
		ArrayList li = new ArrayList<>();
		list.forEach((s) -> {
			li.add(fun.apply(s));
		});
		return li;
	}
}
//单一抽象方法的接口--函数接口@FunctionalInterface
@FunctionalInterface
interface Fly{
	void fly(String s);
	default void show() {
		System.out.println("默认方法");
	}
}

//方法参考
class TeacherCompare{
	public static int compareName(Teacher t1,Teacher t2) {
		return t1.getName().compareTo(t2.getName());
	}
	public static int compareNameLength(Teacher t1,Teacher t2) {
		return t1.getName().length() - t2.getName().length();
	}
	public static int comparemajor(Teacher t1,Teacher t2) {
		return t1.getMajor().compareTo(t2.getMajor());
	}
	public static int compareAge(Teacher t1,Teacher t2) {
		return t1.getAge() - t2.getAge();
	}
}
class Student{
	private String name;

	public Student(String name) {
		super();
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Student [name=" + name + "]";
	}
	
}