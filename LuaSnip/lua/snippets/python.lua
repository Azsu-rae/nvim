
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

local dheadfmt = fmt(dhead, {
    i(1, "img"),
    i(2, "IMAGE_NAME.EXT"),
    rep(1),
})

ls.add_snippets("python", {
    s("dhead", dheadfmt)
})

local headfmt = fmt(head, {
    i(1, "img"),
    i(2, "IMAGE_NAME.EXT"),
    rep(1),
})

ls.add_snippets("python", {
    s("dhead", headfmt)
})

local read = [[
    {} = cv2.imread("{{}}/{}.{}".format(imgpath))
    if {} is None:
        raise ValueError("No image!")
]]

local cvread = fmt(read, {
    i(1, "img"),
    i(2, "IMAGE_NAME"),
    i(3, "EXT"),
    rep(1),
})

ls.add_snippets("python", {
    s("cvread", cvread)
})
