package net.java_school.user;

public class UserService {
    private UserDao dao = UserDao.getInstance();
    
    //회원가입
    public void addUser(User user) {
        dao.insert(user);
    }
    
    //로그인
    public User login(String email, String passwd) {
        return dao.login(email, passwd);
    }
    
    //회원정보수정
    public int editAccount(User user) {
        return dao.update(user);
    }
    
    //비밀번호 변경
    public int changePasswd(String currentPasswd, String newPasswd, String email) {
        return dao.update(currentPasswd, newPasswd, email);
    }
    
    //탈퇴
    public int bye(String email, String passwd) {
        return dao.delete(email, passwd);
    }

    //유저찾기
    public User getUser(String email) {
        return dao.selectOne(email);
    }
        
}
