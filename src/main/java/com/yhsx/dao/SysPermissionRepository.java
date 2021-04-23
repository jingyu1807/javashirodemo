package com.yhsx.dao;


import com.yhsx.model.SysPermission;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface SysPermissionRepository extends PagingAndSortingRepository<SysPermission, Integer>,
        JpaSpecificationExecutor<SysPermission> {
	
	SysPermission findByName(String name);
	
}
