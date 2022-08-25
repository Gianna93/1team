package com.pro.pro.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.pro.pro.model.Notice;

public interface NoticeRepository extends JpaRepository<Notice,Integer>{
		
		@Modifying
		@Query(value="update notice n set n.count = n.count + 1 where n.num = :num"
		,nativeQuery=true)
		int updateCount(int num);
}
