/*
 * Copyright 2015-2017 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.beginner.base.utils;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * 路径工具类
 */
public class PathUtil {

	/**
	 * 图片访问路径
	 * 
	 * @param pathType 		图片类型 visit-访问；save-保存
	 * @param pathCategory 	图片类别，如：话题图片-topic、话题回复图片-reply、商家图片
	 * @return String		图片访问路径
	 */
	public static String getPicturePath(String pathType, String pathCategory) {
		String strResult = "";
		StringBuffer strBuf = new StringBuffer();
		if ("visit".equals(pathType)) {
		} else if ("save".equals(pathType)) {
			String projectPath = PublicUtil.getPorjectPath().replaceAll("\\\\", "/");
			projectPath = splitString(projectPath, "bin/");
			strBuf.append(projectPath);
			strBuf.append("webapps/ROOT/");
		}
		strResult = strBuf.toString();
		return strResult;
	}

	private static String splitString(String str, String param) {
		String result = str;
		if (str.contains(param)) {
			int start = str.indexOf(param);
			result = str.substring(0, start);
		}
		return result;
	}

	/**
	 * 获取classpath
	 * @return String D:/workspace/Beginner/src/main/webapp/WEB-INF/classes/../../
	 */
	public static String getClasspath() {
		String path = (String.valueOf(Thread.currentThread().getContextClassLoader().getResource("")) + "../../").replaceAll("file:/", "")
				.replaceAll("%20", " ").trim();
		if (path.indexOf(":") != 1) {
			path = File.separator + path;
		}
		return path;
	}

	/**
	 * 获取classpath
	 * @return String D:/workspace/Beginner/src/main/webapp/WEB-INF/classes/
	 */
	public static String getClassResources() {
		String path = (String.valueOf(Thread.currentThread().getContextClassLoader().getResource(""))).replaceAll("file:/", "")
				.replaceAll("%20", " ").trim();
		if (path.indexOf(":") != 1) {
			path = File.separator + path;
		}
		return path;
	}

	/**
	 * 获取Host
	 * @return String 项目名
	 */
	public static String host() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		return request.getRemoteHost();
	}

	/**
	 * 获取IP
	 * @return String 项目名
	 */
	public static String ip() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		return request.getLocalAddr();
	}

	/**
	 * 获取PORT
	 */
	public static int port() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		return request.getLocalPort();
	}

	/**
	 * 获取项目名
	 * @return String 项目名
	 */
	public static String path() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		return request.getContextPath();
	}

	/**
	 * 获取项目名
	 * @return String 项目名
	 */
	public static String appName() {
		String appName = System.getProperty("user.dir");
		return appName.substring(appName.lastIndexOf("\\") + 1, appName.length());
	}

	/**
	 * 获取项目访问路径
	 * @return String http://ip地址:端口号/项目名/
	 */
	public static String basePath() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
		return basePath;
	}

	public static void main(String[] args) {
		System.out.println(getClasspath());
		System.out.println(getClassResources());
	}
}
