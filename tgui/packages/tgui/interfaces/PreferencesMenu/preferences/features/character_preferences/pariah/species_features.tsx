import { FeatureDropdownInput, Feature, FeatureColorInput, FeatureTextInput, CheckboxInput, FeatureTriColorInput, FeatureToggle } from "../../base";

export const flavor_text: Feature<string> = {
  name: "Flavor Text",
  description: "Describe your character!",
  component: FeatureTextInput,
};

export const ooc_notes: Feature<string> = {
  name: "OOC Notes",
  description: "Talk about your character OOCly!",
  component: FeatureTextInput,
};

export const mutant_colors_color: Feature<string[]> = {
  name: "Mutant Colors",
  description: "Legacy colors for controlling shit.",
  component: FeatureTriColorInput,
};

export const body_markings_toggle: FeatureToggle = {
  name: "Body Markings",
  description: "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_body_markings: Feature<string> = {
  name: "Body Markings Selection",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureDropdownInput,
};

export const body_markings_color: Feature<string[]> = {
  name: "Body Markings Colors",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureTriColorInput,
};

export const tail_toggle: FeatureToggle = {
  name: "Tail",
  description: "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_tail: Feature<string> = {
  name: "Tail Selection",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureDropdownInput,
};

export const tail_color: Feature<string[]> = {
  name: "Tail Colors",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureTriColorInput,
};

export const snout_toggle: FeatureToggle = {
  name: "Snout",
  description: "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_snout: Feature<string> = {
  name: "Snout Selection",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureDropdownInput,
};

export const snout_color: Feature<string[]> = {
  name: "Snout Colors",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureTriColorInput,
};

export const horns_toggle: FeatureToggle = {
  name: "Horns",
  description: "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_horns: Feature<string> = {
  name: "Horns Selection",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureDropdownInput,
};

export const horns_color: Feature<string[]> = {
  name: "Horns Colors",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureTriColorInput,
};

export const ears_toggle: FeatureToggle = {
  name: "Ears",
  description: "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_ears: Feature<string> = {
  name: "Ears Selection",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureDropdownInput,
};

export const ears_color: Feature<string[]> = {
  name: "Ears Colors",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureTriColorInput,
};

export const frills_toggle: FeatureToggle = {
  name: "Frills",
  description: "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_frills: Feature<string> = {
  name: "Frills Selection",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureDropdownInput,
};

export const frills_color: Feature<string[]> = {
  name: "Frills Colors",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureTriColorInput,
};

export const spines_toggle: FeatureToggle = {
  name: "Spines",
  description: "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_spines: Feature<string> = {
  name: "Spines Selection",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureDropdownInput,
};

export const spines_color: Feature<string[]> = {
  name: "Spines Colors",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureTriColorInput,
};

export const feature_fluff: Feature<string> = {
  name: "Fluff Selection",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureDropdownInput,
};

export const fluff_color: Feature<string[]> = {
  name: "Fluff Colors",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureTriColorInput,
};

export const head_acc_toggle: FeatureToggle = {
  name: "Head Accessories",
  description: "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_head_acc: Feature<string> = {
  name: "Head Accessories Selection",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureDropdownInput,
};

export const head_acc_color: Feature<string[]> = {
  name: "Head Accessories Colors",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureTriColorInput,
};

export const neck_acc_toggle: FeatureToggle = {
  name: "Neck Accessories",
  description: "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_neck_acc: Feature<string> = {
  name: "Neck Accessories Selection",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureDropdownInput,
};

export const neck_acc_color: Feature<string[]> = {
  name: "Neck Accessories Colors",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureTriColorInput,
};

export const skin_tone_toggle: FeatureToggle = {
  name: "Uses skintone",
  component: CheckboxInput,
};

export const undershirt_color: Feature<string> = {
  name: "Undershirt color",
  component: FeatureColorInput,
};

export const socks_color: Feature<string> = {
  name: "Socks color",
  component: FeatureColorInput,
};
