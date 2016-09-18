package com.hfsc.service.impl;

import java.util.List;


import com.hfsc.dao.CommentDao;
import com.hfsc.dao.CommentDao;
import com.hfsc.dao.impl.CommentDaoImpl;
import com.hfsc.dao.impl.CommentDaoImpl;
import com.hfsc.model.Comment;
import com.hfsc.model.Page;
import com.hfsc.model.Comment;
import com.hfsc.service.CommentService;

public class CommentServiceImpl implements CommentService{
	  private static final Comment NULL = null;

	@Override
	    public void insertComment(Comment Comment) {
		  CommentDao commentDao = new CommentDaoImpl();
	      commentDao.insertComment(Comment);
	    }
	    
	    @Override
	    public void updateComment(Comment comment) {
	    	CommentDao commentDao = new CommentDaoImpl();
	        commentDao.updateComment(comment);
	        
	    }
	    
	    @Override
	    public void deleteComment(Comment comment) {
	    	CommentDao commentDao = new CommentDaoImpl();
	    	commentDao.deleteComment(comment);
	        
	    }
	    
	    @Override
	    public List<Comment> queryComment(Comment comment,Page page) {
	    	CommentDao commentDao = new CommentDaoImpl();
	        return commentDao.queryComment(comment,page);
	    }
	    
	  /*  @Override
	    public Comment queryCommentByCommentId(Long id) {
	    	CommentDao commentDao = new CommentDaoImpl();
	    	Comment comment = new Comment();
	        Page page = new Page();
	        comment.setComment_id(id);
	        page.setPage(1);
	        List<Comment> list = commentDao.queryComment(comment,page);
	        if (0 == list.size()) {
	        	comment = new Comment();
	        	return comment;
	        }
	        else {
	        	return list.get(0);
	        }
	    }*/
	    @Override
	    public List<Comment> queryCommentByClass_id(int Class_id) {
	    	CommentDao commentDao = new CommentDaoImpl();
	        Comment comment = new Comment();
	        
	        Page page = new Page();
	        page.setPage(1);
	        comment.setClass_id(Class_id);
	        List<Comment> list = commentDao.queryComment(comment,page);
	        if (0 == list.size()) {
	        	comment = new Comment();
	        	return list;
	        }
	        else {
	        	return list;
	        }
	        
	    }
	  
	

	    @Override
	    public List<Comment> queryCommentByStudent_id(int Student_id) {
	    	CommentDao commentDao = new CommentDaoImpl();
	        Comment comment = new Comment();
	        
	        Page page = new Page();
	        page.setPage(1);
	        comment.setStudent_id(Student_id);
	        List<Comment> list = commentDao.squeryComment(comment,page);
	        if (0 == list.size()) {
	        	comment = new Comment();
	        	return list;
	        }
	        else {
	        	return list;
	        }
	        
	    }

		
	}