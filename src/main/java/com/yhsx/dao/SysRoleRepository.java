package com.yhsx.dao;


import com.yhsx.model.SysRole;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface SysRoleRepository extends PagingAndSortingRepository<SysRole, Integer>,
        JpaSpecificationExecutor<SysRole> {
	
	SysRole findByRole(String role);
	
}
