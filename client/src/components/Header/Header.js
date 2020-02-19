import React, { useContext } from "react";
import AppBar from "@material-ui/core/AppBar";
import Toolbar from "@material-ui/core/Toolbar";
import IconButton from "@material-ui/core/IconButton";
import Menu from "@material-ui/core/Menu";
import MenuItem from "@material-ui/core/MenuItem";
import MoreVertIcon from "@material-ui/icons/MoreVert";
import AddCircleIcon from "@material-ui/icons/AddCircle";
import FingerprintIcon from "@material-ui/icons/Fingerprint";
import PowerSettingsNewIcon from "@material-ui/icons/PowerSettingsNew";
import Button from "@material-ui/core/Button";
import Grid from "@material-ui/core/Grid";
import Box from "@material-ui/core/Box";
import "./Header.scss";
import { Link } from "react-router-dom";
import { LOGOUT_MUTATION, VIEWER_QUERY } from "../../apollo/queries";
import { ViewerContext } from "../../context/ViewerProvider";
import { Mutation } from "react-apollo";
import client from "../../apollo";

const Header = props => {
  const [anchorEl, setAnchorEl] = React.useState(null);
  const viewerContext = useContext(ViewerContext);
  const open = Boolean(anchorEl);

  const handleClick = event => {
    setAnchorEl(event.currentTarget);
  };

  const handleClose = () => {
    setAnchorEl(null);
  };
  return (
    <AppBar position="static">
      <Toolbar className="toolBar">
        <Link to="/">
          <img
            src={require("../../images/boomtown.svg")}
            alt=""
            style={{ width: 40 }}
          />
        </Link>
        <div>
          <Link to="/share">
            <Button>
              <AddCircleIcon />
              SHARE SOMETHING
            </Button>
          </Link>
          <IconButton
            aria-label="more"
            aria-controls="long-menu"
            aria-haspopup="true"
            onClick={handleClick}
          >
            <MoreVertIcon />
          </IconButton>
          <Menu
            id="long-menu"
            anchorEl={anchorEl}
            keepMounted
            open={open}
            onClose={handleClose}
            PaperProps={{
              style: {
                width: 200
              }
            }}
          >
            <Link onClick={handleClose} to="/profile">
              <MenuItem>
                <FingerprintIcon />
                your profile
              </MenuItem>
            </Link>
            <Mutation
              mutation={LOGOUT_MUTATION}
              onCompleted={() => {
                client.resetStore();
              }}
            >
              {(logoutMutation, { data }) => {
                return (
                  <MenuItem
                    onClick={() => {
                      console.log("logout");
                      logoutMutation();
                    }}
                  >
                    <PowerSettingsNewIcon />
                    log out
                  </MenuItem>
                );
              }}
            </Mutation>
          </Menu>
        </div>
      </Toolbar>
    </AppBar>
  );
};

export default Header;
