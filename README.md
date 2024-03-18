# Step 0. 
workspace로 이동  
	- cd ROS_humble_docker/docker_run_shell  
	- docker build -t humble_jammy:240318 .  

# Step 1. 
실행할 shell 파일에 권한 부여  
- chmod +x container_run.sh 

# Step 2.
shell 파일 실행  
- ./container_run.sh <container_name> <image_name:tag>  

예시)  
- ./container_run.sh humble_jammy humble_jammy:240318  

컨테이너 이름 : humble_jammy  
이미지 : humble_jammy   
이미지의 태그 : 240318  
	



# [참고]
아래 링크를 보고 참고하였습니다. 도움 주심에 진심으로 감사합니다.  
https://github.com/Taeyoung96/FAST_LIO_ROS2/tree/ros2
