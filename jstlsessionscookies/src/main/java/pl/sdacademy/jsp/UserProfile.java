package pl.sdacademy.jsp;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserProfile {
    private String name;
    private String surname;
    private int age;
    private String email;
    private String phone;
    private String zipcode;
}
