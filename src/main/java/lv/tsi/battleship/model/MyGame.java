package lv.tsi.battleship.model;

import javax.enterprise.context.SessionScoped;
import javax.inject.Named;
import java.io.Serializable;

@Named
@SessionScoped
public class MyGame implements Serializable {
    private User user;
    private Game game;
    public boolean isMyTurn(){
        if (user == game.getPlayer1()) {
            return game.isPlayer1Turn();
        }else {
            return !game.isPlayer1Turn();
        }

    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Game getGame() {
        return game;
    }

    public void setGame(Game game) {
        this.game = game;
    }
}
