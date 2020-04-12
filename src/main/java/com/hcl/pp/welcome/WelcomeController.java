package com.hcl.pp.welcome;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

import com.hcl.pp.model.Pet;
import com.hcl.pp.model.User;

@Controller
public class WelcomeController {

	@Autowired
	RestTemplate restTemplate;
	
	@RequestMapping("/")
	public String welcome() {
		return "main";
	}
	
	@RequestMapping("/login")
	public String login(Model model) {
		model.addAttribute("user", new User());
		return "login";
	}
	
	@RequestMapping("/home")
	public String home(Model model) {
		List<Pet> pets = restTemplate.exchange("http://pet-businessservice/pets/getAllPets", HttpMethod.GET, null, new ParameterizedTypeReference<List<Pet>>() {}).getBody();
		model.addAttribute("pets", pets);
		return "home";
	}
	
	@PostMapping("/login")
	public String loginForm(@ModelAttribute User user, Model model) {
		User user1 = restTemplate.exchange("http://pet-businessservice/users/{byName}", HttpMethod.GET, null, new ParameterizedTypeReference<User>() {},user.getUsername()).getBody();
		if(user1 == null)
			return "redirect:/login?invalid";
		else if(!user1.getPassword().equals(user.getPassword()))
			return "redirect:/login?incorrectpass";
		else {
			List<Pet> pets = restTemplate.exchange("http://pet-businessservice/pets/getAllPets", HttpMethod.GET, null, new ParameterizedTypeReference<List<Pet>>() {}).getBody();
			model.addAttribute("pets", pets);
			return "home";			
		}
	}
	
	/*
	 * @Bean //@LoadBalanced public RestTemplate restTemplate() { return new
	 * RestTemplate(); }
	 */
	
}
