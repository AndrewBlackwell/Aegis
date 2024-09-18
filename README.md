# Work In Progress -- Come Back Later

---

# Aegis: Ray Tracing Project (CUDA)

**Version 1** of Aegis is a CUDA-based port of **Helios**, described in _Ray Tracing in One Weekend_ by Peter Shirley. This version lays the foundation of the ray tracing engine, focusing on generating a simple image using CUDA parallelism, creating basic geometric shapes, and implementing surface shading with a camera that sends rays into the scene.

- **PPM Image Format**: The output image is stored in the PPM format, a simple text-based image format that is easy to work with and visualize.
- **Color Utility Functions**: A utility class for handling RGB color values, vector arithmetic, and color manipulations.
- **Simple Camera**: A basic implementation of a camera that sends rays through each pixel.
- **Background Rendering**: A gradient background color that is used when a ray does not hit any objects.
- **Ray-Sphere Intersection**: The fundamental geometric operation to calculate if and where a ray intersects with a sphere.
- **Shading with Surface Normals**: Computes shading based on the surface normal at the intersection point, giving the sphere a three-dimensional appearance.
- **Abstraction for Hittable Objects**: Generalizes objects that can be "hit" by a ray (starting with spheres).
- **Multiple Objects**: Enables rendering of more than one object in the scene.
- **RNG Anti-Aliasing**: Used to sample rays randomly within each pixel, introducing antialiasing to smooth jagged edges.
- **Multiple Samples per Pixel**: Each pixel's color is determined by averaging several ray samples, resulting in smoother images.

---

**Version 2** of Aegis builds upon the core of **Helios** by adding advanced features like motion blur, bounding volume hierarchies, texture mapping, and more. This version further optimizes rendering through CUDA parallelism and introduces essential techniques for more complex scenes.

- **Motion Blur**: Adds support for simulating motion blur by introducing space-time ray tracing and managing time in the scene.
- **Bounding Volume Hierarchies (BVH)**: Implements axis-aligned bounding boxes (AABBs) and hierarchies of bounding volumes to optimize the ray-object intersection process, resulting in faster rendering.
- **Texture Mapping**: Introduces constant color and checker textures, with support for texture coordinates on spheres, enabling more detailed object surfaces.
- **Perlin Noise**: Generates procedural textures with Perlin noise, improving texture realism through turbulence and frequency adjustments.
- **Quadrilaterals**: Adds ray-plane intersection, defining quadrilaterals, and testing UV coordinates for intersection within the surface.
- **Lights**: Implements emissive materials and background color handling, allowing objects to be treated as light sources. A simple Cornell Box setup is included.
- **Instances**: Introduces instance translation and rotation, enabling reusable transformations on objects in the scene.
- **Volumes**: Adds constant-density mediums to simulate smoke and fog, enabling realistic volumetric effects in scenes like a Cornell Box filled with fog.

---

**Version 3** of Aegis expands the ray tracing engine with Monte Carlo techniques for more realistic light interactions and sampling, adding sophisticated handling of light scattering, importance sampling, and direct light sampling.

- **Monte Carlo Estimation**: Implements a basic Monte Carlo method for estimating values, including Pi, with convergence tests and stratified (jittered) sampling for improved accuracy.
- **Monte Carlo Integration**: Extends the Monte Carlo method to integrate one-dimensional functions and approximate distributions with importance sampling, improving sampling efficiency.
- **Light Scattering**: Simulates realistic light scattering using albedo and scattering PDFs, ensuring accurate distribution of light within the scene.
- **Importance Sampling**: Incorporates importance sampling to better handle complex lighting scenarios, revisiting the Cornell Box setup to test the integration with random hemispherical sampling.
- **Random Direction Generation**: Introduces random direction sampling relative to axes, including uniform and cosine-weighted sampling of hemispheres, useful for light and reflection simulations.
- **Orthonormal Bases**: Implements an orthonormal basis (ONB) class for transforming between coordinate systems, allowing for flexible manipulation of object and light orientations.
- **Direct Light Sampling**: Directly samples light sources, calculating PDFs for lights and using unidirectional light for efficient rendering.
- **Mixture Densities**: Adds mixture PDFs, allowing sampling from a combination of multiple densities for more accurate ray-object interactions.
- **PDF Management and Cleanup**: Refines PDF handling for both diffuse and specular materials, integrates PDF functions into hittable lists, and includes optimizations to reduce visual artifacts like surface acne.

## Getting Started

### Prerequisites

- CUDA Toolkit installed
- C++17 or later
- CMake 3.14+
- A GPU that supports CUDA

### Compilation and Running

1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo/aegis-cuda.git
   ```
2. Build the project:
   ```bash
   cmake -B build
   cmake --build build
   ```
3. Run the executable:
   ```bash
   build/aegis > output.ppm
   ```

## Performance

- This version uses CUDA to parallelize the ray tracing process, where each GPU thread is responsible for computing the color of one pixel. This drastically reduces rendering time compared to a CPU implementation.
