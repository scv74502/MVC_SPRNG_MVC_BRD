package com.spring.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.board.dto.BoardDto;
import com.spring.board.form.BoardForm;
import com.spring.board.service.BoardService;;

@Controller
@RequestMapping(value = "/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	/** �Խ��� - ��� ������ �̵� */
	@RequestMapping(value = "/boardList")
	public String getBoardList(HttpServletRequest request, HttpServletResponse response) throws Exception {
			return "board/boardList";
	}
	
	/** �Խ��� - ��� ��ȸ */
	@RequestMapping(value = "/getBoardList")
	@ResponseBody
	public List<BoardDto> getBoardList(HttpServletRequest request, HttpServletResponse response, BoardForm boardForm) throws Exception {
		
		List<BoardDto> boardList = boardService.getBoardList(boardForm);
		
		return boardList;
	}

	/** �Խ��� - �� ������ �̵� */
	@RequestMapping(value = "/boardDetail")
	public String getBoardDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
			return "board/boardDetail";
	}
	
	/** �Խ��� - �� ��ȸ */
	@RequestMapping(value = "/getBoardDetail")
	@ResponseBody
	public BoardDto getBoardDetail(HttpServletRequest request, HttpServletResponse response, BoardForm boardForm) throws Exception {
		
		BoardDto boardDto = boardService.getBoardDetail(boardForm);
		
		return boardDto;
	}
	
	/** �Խ��� - �ۼ� ������ �̵� */
	@RequestMapping(value = "/boardWrite")
	public String boardWrite(HttpServletRequest request, HttpServletResponse response, BoardForm boardForm) throws Exception {
		
			return "board/boardWrite";
	} 
	
	/** �Խ��� - ��� */
	@RequestMapping(value = "/insertBoard")
	@ResponseBody
	public BoardDto insertBoard(HttpServletRequest request, HttpServletResponse response, BoardForm boardForm) throws Exception {
			
			BoardDto boardDto = boardService.insertBoard(boardForm);
			
			return boardDto;
	} 

	/** �Խ��� - ���� */
	@RequestMapping(value = "/deleteBoard")
	@ResponseBody
	public BoardDto deleteBoard(HttpServletRequest request, HttpServletResponse response, BoardForm boardForm) throws Exception {
			
			BoardDto boardDto = boardService.deleteBoard(boardForm);
			
			return boardDto;
	} 
	
	/** �Խ��� - ���� ������ �̵� */
	@RequestMapping(value = "/boardUpdate")
	@ResponseBody
	public BoardDto boardUpdate(HttpServletRequest request, HttpServletResponse response, BoardForm boardForm) throws Exception {
		
			return "board/boardUpdate";
	}  
	
	/** �Խ��� - ���� */
	@RequestMapping(value = "/updateBoard")
	@ResponseBody
	public BoardDto updateBoard(HttpServletRequest request, HttpServletResponse response, BoardForm boardForm) throws Exception {
			
			BoardDto boardDto = boardService.updateBoard(boardForm);
			
			return boardDto;
	} 
}
