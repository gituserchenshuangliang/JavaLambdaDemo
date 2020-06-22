package com.lambda.demo;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * java.util.stream套件
  * 一个管道基本包含下面三个部分：
  * 来源
  * 零或者多个中间操作
  * 一个最终操作
 * @author Cherry
 * 2020年4月14日
 */
public class JavaStream {
	public static void main(String[] args) throws IOException {
//		show();
		show1();
	}
	
	public static void show() throws IOException {
		Path p = Paths.get("E:\\WKS2019\\JavaLambdaDemo\\src\\com\\lambda\\demo\\A.bat");
		Stream<String> s = Files.lines(p);
		s.forEach(System.out::println);
		s.filter(f -> f.startsWith("REM")).forEach(System.out::println);
	}
	
	//List通过stream()方法获取Stream管道
	public static void show1() {
		Teacher[] te = {new Teacher("Jack",23,"Math"),new Teacher("Marry",15,"English"),new Teacher("Jhon",34,"Physic")};
		List<Teacher> array = Arrays.asList(te);
		//filter()过滤管道流，map()处理管道流
		array.stream().filter(t -> t.getAge() > 15)
					   .map(Teacher::getName)
					   .forEach(System.out::println);
		int sum = array.stream().mapToInt(Teacher::getAge)
//					  .average().getAsDouble().min().max()
					  .sum();
		//reduce()和collect()
		int average = array.stream().mapToInt(Teacher::getAge).reduce((x,y) -> x+y).getAsInt()/array.size();
		List<Teacher> li = array.stream().filter(t -> t.getAge() > 15).collect(Collectors.toList());
		li.forEach(System.out::println);
		//隐藏空值判断flatMap(),前一个盒子与下一个盒子之间的关系转换，判断是否有值
	}
} 



