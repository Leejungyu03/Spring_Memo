package com.memo.post.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.memo.post.model.Post;

@Repository
public interface PostDAO {

	public List<Post> selectPostListByUserId(int userId);
	
	public int addPost(
			String userId,
			int userLoginId,
			String subject,
			String content,
			MultipartFile file);
}
