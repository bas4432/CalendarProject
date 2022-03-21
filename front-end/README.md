# Calendar practice
캘린더 기능을 구현

## Description
* frontEnd Module : react
* backEnd Module : spring boot

## Learning Point
Props / State 차이점
* Props : 부모 컴포넌트가 자식 컴포넌트에 값을 전달할 때 사용하는 것. 값 수정 불가. 
* State : 컴포넌트 자기 자신이 가지고 있는 값. 변화가 필요할 경우 setState()함수를 통해 값 변경 가능.

@Controller
* 전통적인 Spring MVC의 컨트롤러인 @Controller는 주로 View를 반환하기 위해 사용.
* 바디를 자바객체로 받기 위해서는 @ResponseBody 어노테이션을 반드시 명시.

@RestController
* 스프링프레임워크 4.x 버전 이상부터 사용가능한 어노테이션으로 @Controller에 @ResponseBody가 결합된 어노테이션입.
* @Controller와는 다르게 @RestController는 리턴값에 자동으로 @ResponseBody가 붙게되어 별도 어노테이션을 명시해주지 않아도 HTTP 응답데이터(body)에 자바 객체가 매핑되어 전달 가능.

@RequestBody
* 클라이언트에서 서버로 필요한 데이터를 요청하기 위해 JSON 데이터를 요청 본문에 담아서 서버로 보내면, 서버에서는 @RequestBody 어노테이션을 사용하여 HTTP 요청 본문에 담긴 값들을 자바객체로 변환시켜, 객체에 저장.

@ResponseBody
* 서버에서 클라이언트로 응답 데이터를 전송하기 위해 @ResponseBody 어노테이션을 사용하여 자바 객체를 HTTP 응답 본문의 객체로 변환하여 클라이언트로 전송.

유효성 검사
* https://lodash.com/ -> undefined, null, ''를 한꺼번에 체크 할 수 있는 라이브러리