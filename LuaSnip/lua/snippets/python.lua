
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local head = [[
from pathlib import Path
imgpath = Path.home() / "Data" / "Images"

import cv2
{} = cv2.imread("{{}}/{}.bmp".format(imgpath))
if {} is None:
    raise ValueError("No image!")

]]

local dhead = [[

from pathlib import Path
imgpath = Path.home() / "OneDrive" / "Data" / "Images"

import cv2
{} = cv2.imread("{{}}/{}.bmp".format(imgpath))
if {} is None:
    raise ValueError("No image!")

]]

local dimg = fmt(dhead, {
    i(1, "img"),
    i(2, "IMAGE_NAME.EXT"),
    rep(1),
})

ls.add_snippets("python", {
    s("dhead", dimg)
})

local img = fmt(head, {
    i(1, "img"),
    i(2, "IMAGE_NAME.EXT"),
    rep(1),
})

ls.add_snippets("python", {
    s("dhead", img)
})
