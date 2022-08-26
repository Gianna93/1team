package com.pro.pro.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pro.pro.model.Reply;

public interface ReplyRepository extends JpaRepository<Reply, Long> {

	void deleteById(int replyId);

}
