package com.hfsc.service;

import java.util.List;

import com.hfsc.model.Activity;
import com.hfsc.model.Comment;
import com.hfsc.model.Page;
import com.hfsc.model.User;

public interface CommentService {
	

	public void deleteComment(Comment comment);

	public void updateComment(Comment comment);

	public void insertComment(Comment comment);
	
	public List<Comment> queryComment(Comment comment, Page page);

	  
	  public List<Comment> queryCommentByStudent_id(int Student_id);
	  public List<Comment> queryCommentByClass_id(int Class_id);

}
