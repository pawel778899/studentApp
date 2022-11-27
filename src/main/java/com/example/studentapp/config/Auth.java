package com.example.studentapp.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class Auth extends WebSecurityConfigurerAdapter {

    @Bean
    protected PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.inMemoryAuthentication()
                .withUser("test").password(passwordEncoder().encode("test")).roles("USER")
                .and()
                .withUser("admin").password(passwordEncoder().encode("admin")).roles("ADMIN");
    }


    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/students") // mają dostęp wszyscy użytkownicy ROLE_USER
                .hasAnyAuthority("ROLE_USER")
                .antMatchers("/tasks")
                .hasAnyAuthority("ROLE_ADMIN")
                .antMatchers("/")
                .permitAll()
                .and()
                .csrf().disable() // wyłączamy zabezpieczenie csrf w celu użycia postmana
                .headers().frameOptions().disable()
                .and()
                .formLogin() // wskazuje, że teraz będę konfigurował formularz autoryzacji
                .loginPage("/login") // wskazuje endpoint w którym będzie się odbywać autoryzacja
                .usernameParameter("username") // nadajemy nazwę jaka będzie jako name w inpucie loginu formularza
                .passwordParameter("password")// nadajemy nazwę jaka będzie jako name w inpucie hasła formularza
                .loginProcessingUrl("/login")
                .failureForwardUrl("/login?error") // co się stanie w momencie błędnego wpisania loginu i hasła
                .defaultSuccessUrl("/")// co się stanie w momencie prawidłowego wpisania loginu i hasła
                .and()
                .logout() // mówimy springowi, że przechodzimy do obsługi logout
                .logoutSuccessUrl("/login");
    }
}

