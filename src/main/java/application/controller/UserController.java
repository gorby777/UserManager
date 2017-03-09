package application.controller;

import application.dao.UserDaoImpl;
import application.model.User;
import application.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {
    private DBCreation creator = new DBCreation();
    private UserService userService;
    private int shift = 0;
    private int shiftByName = 0;
    private String name = "";

    @Autowired(required = true)
    @Qualifier(value = "userService")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = "toJar", method = RequestMethod.GET)
    public String toJar(Model model){
        return "toJar";
    }

    @RequestMapping(value = "userList", method = RequestMethod.GET)
    public String listUsers(Model model){
        model.addAttribute("user", new User());
        model.addAttribute("listUsers", this.userService.listUsers(shift));

        return "userList";
    }

    @RequestMapping(value = "userListByName", method = RequestMethod.GET)
    public String listUsersByName(Model model){
        model.addAttribute("user", new User());
        model.addAttribute("listUsers", this.userService.find(name, shiftByName));

        return "userListByName";
    }

    @RequestMapping(value = "find", method = RequestMethod.POST)
    public String find(Model model, @ModelAttribute("usersName") String usersName){
        name=usersName;
        model.addAttribute("listUsers", this.userService.find(usersName, shift));

        return "redirect:/userListByName";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User user){
        if(user.getId() == 0){
            this.userService.addUser(user);
        }else {
            this.userService.updateUser(user);
        }
        return "redirect:/userList";
    }

    @RequestMapping(value = "/remove/{id}")
    public String removeUser(@PathVariable("id") int id){
        this.userService.removeUser(id);

        return "redirect:/userList";
    }

    @RequestMapping(value = "edit/{id}")
    public String editUser(@PathVariable("id") int id, Model model){
        model.addAttribute("user", this.userService.getUserById(id));
        model.addAttribute("listUsers", this.userService.listUsers(shift));

        return "userList";
    }

    @RequestMapping(value = "userData/{id}")
    public String userData(@PathVariable("id") int id, Model model){
        model.addAttribute("user", this.userService.getUserById(id));

        return "userData";
    }

    @RequestMapping(value = "prev", method = RequestMethod.POST)
    public String shiftPrev(){
        shift-= UserDaoImpl.frameRows;
        if(shift<0)shift=0;

        return "redirect:/userList";
    }

    @RequestMapping(value = "next", method = RequestMethod.POST)
    public String shiftNext(){
        shift+= UserDaoImpl.frameRows;
        if(shift>=UserDaoImpl.allRows)shift-=UserDaoImpl.frameRows;

        return "redirect:/userList";
    }

    @RequestMapping(value = "prev1", method = RequestMethod.POST)
    public String shiftPrev1(){
        shiftByName-= UserDaoImpl.frameRows;
        if(shiftByName<0)shiftByName=0;

        return "redirect:/userListByName";
    }

    @RequestMapping(value = "next1", method = RequestMethod.POST)
    public String shiftNext1(){
        shiftByName+= UserDaoImpl.frameRowsByName;
        if(shiftByName>=UserDaoImpl.allRowsByName)shiftByName-=UserDaoImpl.frameRowsByName;

        return "redirect:/userListByName";
    }

    @RequestMapping(value = "create", method = RequestMethod.GET)
    public String createDB(){
        creator.createDB();

        return "redirect:/userList";
    }
}
