package com.hcl.pp.welcome;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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
	
	@RequestMapping("/myPets")
	public String myPets(Model model) {
		long id = getCurrentUserId();
		List<Pet> pets = restTemplate.exchange("http://pet-businessservice/users/myPets/{ownerid}", HttpMethod.GET, null, new ParameterizedTypeReference<List<Pet>>() {},id).getBody();
		model.addAttribute("pets", pets);
		return "mypets";
	}
	
	@RequestMapping("/addPet")
	public String addPet(Model model) {
		model.addAttribute("pet", new Pet());
		return "addpet";
	}
	
	@PostMapping(value = "/addPet", consumes = MediaType.ALL_VALUE)
	public String addPet(@ModelAttribute Pet pet) {
		String status = restTemplate.postForObject("http://pet-businessservice/pets/addPet", pet, String.class);
		if(status.contains("saved"))
			return "redirect:/home";
		else
			return "error";
	}
	
	@RequestMapping("/buyPet/{petid}")
	public String buyPet(@PathVariable long petid) {
		restTemplate.exchange("http://pet-businessservice/users/buyPet/{petid}/{ownerid}", HttpMethod.PUT, null, new ParameterizedTypeReference<String>() {}, petid, getCurrentUserId()).getBody();
		return "redirect:/home";
	}
	
	private long getCurrentUserId() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		UserDetails username = (UserDetails) auth.getPrincipal();
		User user = restTemplate.exchange("http://pet-businessservice/users/{byName}", HttpMethod.GET, null, new ParameterizedTypeReference<User>() {}, username.getUsername()).getBody();
		return user.getUserId();
	}
	
}
