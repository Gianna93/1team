package com.cos.homepage.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.homepage.model.Notice;

public interface NoticeRepository extends JpaRepository<Notice,Integer>{

}
