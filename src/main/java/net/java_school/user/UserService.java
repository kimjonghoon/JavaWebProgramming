package net.java_school.user;

import java.util.HashMap;
import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.parameters.P;

public interface UserService {
    //회원가입
    public void addUser(User user);

    //회원권한 추가
    public void addAuthority(String email, String authority);

    //내 정보 수정
    @PreAuthorize("hasRole('ADMIN') or #user.email == principal.username")
    public int editAccount(@P("user") User user);

    //비밀번호 변경
    @PreAuthorize("hasRole('ADMIN') or #email == principal.username")
    public int changePasswd(String currentPasswd, String newPasswd, @P("email") String email);

    //탈퇴
    @PreAuthorize("hasRole('ADMIN') or #user.email == principal.username")
    public void bye(@P("user") User user);

    //회원찾기
    @PreAuthorize("hasAnyRole('ADMIN','USER')")
    public User getUser(String email);

    //회원목록
    @PreAuthorize("hasRole('ADMIN')")
    public List<User> getAllUser(HashMap<String, String> hashmap);

    //회원수
    @PreAuthorize("hasRole('ADMIN')")
    public int getTotalCount(String search);

    //권한구하기
    @PreAuthorize("hasRole('ADMIN')")
    public String getAuthority(String email);

    //사용자 정보 수정
    @PreAuthorize("hasRole('ADMIN')")
    public void editAccountByAdmin(User user);

    //비밀번호 변경 by 관리자
    @PreAuthorize("hasRole('ADMIN')")
    public void changePasswdByAdmin(User user);

    //사용자 삭제
    @PreAuthorize("hasRole('ADMIN')")
    public void delUser(User user);

    //사용자 권한
    @PreAuthorize("hasRole('ADMIN')")
    public List<String> getAuthoritiesOfUser(String email);

    //사용자 권한 삭제
    @PreAuthorize("hasRole('ADMIN')")
    public void delAuthorityOfUser(String email, String authority);
}