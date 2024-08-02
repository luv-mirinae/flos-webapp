package im.flos.webapp.api.member.mapper;

import im.flos.webapp.api.member.persistence.MemberDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MemberMapper {
    MemberDTO selectById(@Param("id") Integer id);
    MemberDTO selectByName(@Param("name") String name);
    List<MemberDTO> selectAll();
}
