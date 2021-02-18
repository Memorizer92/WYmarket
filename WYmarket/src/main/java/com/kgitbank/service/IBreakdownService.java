package com.kgitbank.service;

import java.util.List;

import com.kgitbank.model.ShItemVO;

public interface IBreakdownService {

	List<ShItemVO>  getShitemVO();
	int completedIstate(String ititle);
}
