import { DateTime } from "luxon";

export default function(eleventyConfig) {
  eleventyConfig.addPassthroughCopy("src/css");
  eleventyConfig.addPassthroughCopy("src/images");
  
  // Date filter using Luxon
  eleventyConfig.addFilter("date", function(date, format) {
    return DateTime.fromJSDate(date).toFormat(format || "MMMM d, yyyy");
  });

  // Filter posts by tag
  eleventyConfig.addCollection("posts", function(collectionApi) {
    return collectionApi.getFilteredByGlob("src/posts/*.md").sort((a, b) => {
      return b.date - a.date; // newest first
    });
  });

  return {
    dir: {
      input: "src",
      output: "dist",
      includes: "_includes",
    },
    templateFormats: ["md", "njk", "html"],
    htmlTemplateEngine: "njk",
    markdownTemplateEngine: "njk",
  };
}
