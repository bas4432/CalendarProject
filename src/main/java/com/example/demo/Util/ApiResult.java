package com.example.demo.Util;

public class ApiResult<T>  {
	int status;
	T result;
	
	public ApiResult(int status, T result){
		this.status = status;
		this.result = result;
	}
}
