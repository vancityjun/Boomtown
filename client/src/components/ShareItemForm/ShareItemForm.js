import React, { useContext } from "react";
import { ItemPreviewContext } from "../../context/ItemPreviewProvider";
import { TagsContext } from "../../pages/Share/ShareContainer";

import Button from "@material-ui/core/Button";
import Input from "@material-ui/core/Input";
import InputLabel from "@material-ui/core/InputLabel";
import MenuItem from "@material-ui/core/MenuItem";
import FormControl from "@material-ui/core/FormControl";
import ListItemText from "@material-ui/core/ListItemText";
import Select from "@material-ui/core/Select";
import Checkbox from "@material-ui/core/Checkbox";
import Chip from "@material-ui/core/Chip";

const ShareForm = () => {
  const itemPreviewContext = useContext(ItemPreviewContext);
  const tagsContext = useContext(TagsContext);
  const { updatePreview, insertItem } = itemPreviewContext;
  const { tags } = itemPreviewContext.state.item;
  // console.log(tagsContext);
  const flexColumn = {
    display: "flex",
    flexDirection: "column",
    width: "420px",
    float: "left"
  };
  return (
    <form method="post" onSubmit={insertItem} style={flexColumn}>
      <h3>Share. Borrow. Prosper.</h3>
      <input
        name="imgUrl"
        accept="image/*"
        id="contained-button-file"
        type="file"
        style={{ display: "none" }}
        onChange={updatePreview}
      />
      <label htmlFor="contained-button-file">
        <Button variant="contained" color="primary" component="span">
          Select an Image
        </Button>
      </label>
      <Input placeholder="Placeholder" name="title" onChange={updatePreview} />
      <Input
        placeholder="Placeholder"
        multiline
        rows="4"
        name="description"
        onChange={updatePreview}
      />
      <FormControl>
        <InputLabel id="demo-mutiple-checkbox-label">Tag</InputLabel>
        <Select
          labelId="demo-mutiple-checkbox-label"
          id="demo-mutiple-checkbox"
          name="tags"
          multiple
          value={tags}
          onChange={updatePreview}
          input={<Input />}
          renderValue={selected => {
            const tag = selected.map(tags => {
              return tags.title;
            });
            return tag.join(", ");
          }}
          // MenuProps={MenuProps}
        >
          {tagsContext.map(tags => {
            delete tags.__typename;
            const title = tags.title;
            return (
              <MenuItem key={title} value={tags}>
                <Checkbox checked={tagsContext.indexOf(title) > -1} />
                <ListItemText primary={title} />
              </MenuItem>
            );
          })}
        </Select>
      </FormControl>
      <Button
        variant="contained"
        color="primary"
        type="submit"
        disabled={false}
      >
        Share
      </Button>
    </form>
  );
};

export default ShareForm;
