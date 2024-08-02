package im.flos.webapp.api.member.persistence;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
@AllArgsConstructor
public class MemberDTO {
    private Integer id;
    private String short_name;
    private String full_name;
    private String hash;
}
